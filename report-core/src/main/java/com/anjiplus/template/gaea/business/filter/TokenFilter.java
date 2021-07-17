package com.anjiplus.template.gaea.business.filter;


import com.alibaba.fastjson.JSONObject;
import com.anji.plus.gaea.bean.ResponseBean;
import com.anji.plus.gaea.cache.CacheHelper;
import com.anji.plus.gaea.utils.JwtBean;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

/**
 * 简单的鉴权
 * Created by raodeming on 2021/6/24.
 */
@Component
@Order(Integer.MIN_VALUE + 99)
public class TokenFilter implements Filter {
    @Autowired
    private CacheHelper cacheHelper;
    @Autowired
    private JwtBean jwtBean;

    /**跳过token验证和权限验证的url清单*/
    @Value("#{'${customer.skip-authenticate-urls}'.split(',')}")
    private List<String> skipAuthenticateUrls;
    private Pattern SKIP_AUTHENTICATE_PATTERN;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    /** 根据名单，生成正则
     * @param skipUrlList
     * @return
     */
    private Pattern fitByList(List<String> skipUrlList){
        if(skipUrlList == null || skipUrlList.size() == 0){
            return Pattern.compile(".*().*");
        }
        StringBuffer patternString = new StringBuffer();
        patternString.append(".*(");

        skipUrlList.stream().forEach(url ->{
            patternString.append(url.trim());
            patternString.append("|");
        });
        if(skipUrlList.size()>0){
            patternString.deleteCharAt(patternString.length()-1);
        }
        patternString.append(").*");

        return Pattern.compile(patternString.toString());
    }

    @PostConstruct
    private void postConstruct() {
        SKIP_AUTHENTICATE_PATTERN = fitByList(skipAuthenticateUrls);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();

        if(uri.equals("/")){
            response.sendRedirect("/index.html");
            return;
        }

        // 不需要token验证和权限验证的url，直接放行
        boolean skipAuthenticate = SKIP_AUTHENTICATE_PATTERN.matcher(uri).matches();
        if(skipAuthenticate){
            filterChain.doFilter(request, response);
            return;
        }

        //获取token
        String authorization = request.getHeader("Authorization");
        if (StringUtils.isBlank(authorization)) {
            error(response);
            return;
        }

        String username = jwtBean.getUsername(authorization);
//            String uuid = jwtBean.getUUID(authorization);

        if (!cacheHelper.exist(username)) {
            error(response);
            return;
        }

        //延长有效期
        cacheHelper.stringSetExpire(username, authorization, 3600);

        //在线体验版本
        if (username.equals("guest")
                && !uri.endsWith("/dataSet/testTransform")
                && !uri.endsWith("/reportDashboard/getData")
                && !uri.startsWith("/dict")
                && !uri.startsWith("/dict")
        ) {
            //不允许删除
            String method = request.getMethod();
            if ("post".equalsIgnoreCase(method)
                    || "put".equalsIgnoreCase(method)
                    || "delete".equalsIgnoreCase(method)
            ) {
                ResponseBean responseBean = ResponseBean.builder().code("50001").message("在线体验版本，不允许此操作。请自行下载本地运行").build();
                response.getWriter().print(JSONObject.toJSONString(responseBean));
                return;
            }
        }

        //执行
        filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }

    private void error(HttpServletResponse response) throws IOException {
        ResponseBean responseBean = ResponseBean.builder().code("50014").message("The Token has expired").build();
        response.getWriter().print(JSONObject.toJSONString(responseBean));
    }
}
