package org.pachinko.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Description: http工具类
 * Date: 2018/8/25
 * Time: 下午10:32
 */
@Slf4j
public class HttpUtils {

    /**
     * get 请求(简单http请求。非大规模，大规模考虑线程池)
     * @param url
     * @param params
     * @return
     */
    public static  String httpGet(String url,Map<String,String> params){

        if(StringUtils.isEmpty(url)){
            return StringUtils.EMPTY;
        }
        String content = "";

        CloseableHttpClient httpClient = null;
        try{

            //创建httpclient对象
            httpClient = HttpClients.createDefault();
            List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
            if(MapUtils.isNotEmpty(params)){
                for(String key:params.keySet()){
                    nameValuePairs.add(new BasicNameValuePair(key, params.get(key)));
                }
            }
            String str = "";

            if(CollectionUtils.isNotEmpty(nameValuePairs)){
                 str = EntityUtils.toString(new UrlEncodedFormEntity(nameValuePairs,Consts.UTF_8));
            }
            log.warn("http get request param  is :{}",str);

            if(StringUtils.isNotEmpty(str)){
                url = url+"?"+str;
            }
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response=httpClient.execute(httpGet);
            HttpEntity entity=response.getEntity();

            //接收响应头
            content=EntityUtils.toString(entity, "utf-8");

            log.warn("result is :{}",content);

        }catch (Exception e){
            log.error("http client exception :",e);
        }finally {

            if(null != httpClient){
                try {
                    httpClient.close();
                } catch (IOException e) {
                    log.error("http client close exception :",e);
                }
            }
        }

        return content;
    }


    /**
     * get 请求(简单http请求。非大规模，大规模考虑线程池)
     * @param url
     * @param params
     * @return
     */
    public static String httpPost(String url,Map<String,String> params){

        if(StringUtils.isEmpty(url)){
            return StringUtils.EMPTY;
        }
        String content = "";

        CloseableHttpClient httpClient = null;
        try{

            //创建httpclient对象
            httpClient = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(url);

            List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
            if(MapUtils.isNotEmpty(params)){
                for(String key:params.keySet()){
                    nameValuePairs.add(new BasicNameValuePair(key, params.get(key)));

                    log.warn("http client post param is :{},{}",key,params.get(key));
                }
            }
            if(CollectionUtils.isNotEmpty(nameValuePairs)){
                httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "UTF-8"));
            }

            CloseableHttpResponse response = httpClient.execute(httpPost);
            HttpEntity entity = response.getEntity();
            content = EntityUtils.toString(entity, "utf-8");

            //接收响应头
            content=EntityUtils.toString(entity, "utf-8");

            log.warn("http client post result is :{}",content);

        }catch (Exception e){
            log.error("http client post exception :",e);
        }finally {

            if(null != httpClient){
                try {
                    httpClient.close();
                } catch (IOException e) {
                    log.error("http client post close exception :",e);
                }
            }
        }

        return content;
    }



}
