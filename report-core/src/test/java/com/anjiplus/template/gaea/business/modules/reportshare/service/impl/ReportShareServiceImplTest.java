package com.anjiplus.template.gaea.business.modules.reportshare.service.impl;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.junit.jupiter.api.Test;

import java.util.Date;

/**
 * Created by raodeming on 2021/8/18.
 */
public class ReportShareServiceImplTest {

    @Test
    public void jwtTest() throws InterruptedException {

        long l = System.currentTimeMillis();


        String sign = JWT.create()
                .withIssuedAt(new Date())
                .withExpiresAt(new Date(l + 5000))
                .withClaim("reportCode", "report")
                .withClaim("shareCode", "1234567")
                .sign(Algorithm.HMAC256("111"));


        System.out.println(sign);

        Thread.sleep(8000L);

        DecodedJWT verify = JWT.require(Algorithm.HMAC256("111")).build().verify(sign);

        Date expiresAt = verify.getExpiresAt();
        String reportCode = verify.getClaim("reportCode").asString();
        String shareCode = verify.getClaim("shareCode").asString();


        System.out.println(expiresAt);
        System.out.println(reportCode);
        System.out.println(shareCode);



    }

}
