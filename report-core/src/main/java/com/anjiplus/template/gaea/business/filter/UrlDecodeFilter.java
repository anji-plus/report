package com.anjiplus.template.gaea.business.filter;

import com.anji.plus.gaea.constant.GaeaConstant;
import org.apache.catalina.util.ParameterMap;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.ognl.IteratorEnumeration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.Map;
import java.util.Set;

/**
 * @author: Raod
 * @since: 2022-01-26
 */
@Component
@Order(Ordered.HIGHEST_PRECEDENCE + 1)
public class UrlDecodeFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        ParameterMap<String, String[]> parameterMap = (ParameterMap) httpServletRequest.getParameterMap();
        ParamHttpServletRequestWrapper wrapper = new ParamHttpServletRequestWrapper(httpServletRequest, parameterMap);

        Enumeration<String> parameterNames = wrapper.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String parameter = httpServletRequest.getParameter(paramName);
            if (StringUtils.isNotBlank(parameter)) {
                String decode = URLDecoder.decode(parameter, GaeaConstant.CHARSET_UTF8);
                parameterMap.setLocked(false);
                parameterMap.put(paramName, new String[]{decode});
            }
        }
        filterChain.doFilter(wrapper, servletResponse);
    }

    /**
     * 参数
     */
    class ParamHttpServletRequestWrapper extends HttpServletRequestWrapper {

        private ParameterMap<String, String[]> parameterMap;

        public ParamHttpServletRequestWrapper(HttpServletRequest request, ParameterMap<String, String[]> parameterMap) {
            super(request);
            this.parameterMap = parameterMap;
        }

        @Override
        public Map<String, String[]> getParameterMap() {
            return parameterMap;
        }

        @Override
        public Enumeration<String> getParameterNames() {

            Set<String> keySet = parameterMap.keySet();
            IteratorEnumeration iteratorEnumeration = new IteratorEnumeration(keySet.iterator());
            return iteratorEnumeration;
        }

        @Override
        public String[] getParameterValues(String name) {
            return parameterMap.get(name);
        }
    }
}
