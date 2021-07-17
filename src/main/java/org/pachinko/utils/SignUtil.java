//package org.pachinko.utils;
//
//import java.math.BigDecimal;
//
//import org.apache.commons.lang.StringUtils;
//
///**
// * 签名算法
// *
// * @param unknown $key_id S_KEY（商户KEY）
// * @param unknown $array 例子：$array = array('amount'=>'1.00','out_trade_no'=>'2018123645787452',
// *                'callback_url'=>'http://mall.hjllife.top/demo/callback_url.php','success_url'=>'http://mall.hjllife
// *                .top/pay88/index.php');
// * @return string
// */
//
////function sign ($key_id, $array)
////    {
////    $keyString = md5(number_format($array['amount'],2) . $array['out_trade_no'] . $array['callback_url'] .
//// $array['success_url'] .$key_id);
////
////    return md5($keyString);
////    }
////
////    function signHuiDiao($key_id, $array)
////    {
////
////    //利用千位分组来格式化数字的函数number_format()
////    //number_format($array['amount'],2)
////
////    $keyString = md5(number_format($array['amount'],2) . $array['out_trade_no'] . $array['trade_no'].
//// $array['status'] .$key_id);
////
////    return md5($keyString);
////    }
////
////    function json($Code, $Msg, $array = null)
////    {
////    header('Content-type: application/json;charset=utf-8');
////    exit(json_encode(array("code" => $Code, "msg" => $Msg, "data" => $array), JSON_UNESCAPED_UNICODE |
//// JSON_UNESCAPED_SLASHES));
////    }
//
//public class SignUtil {
//
//    /**
//     * 签名
//     *
//     * @param s_key
//     * @param out_trade_no
//     * @param callback_url
//     * @param success_url
//     * @param amount
//     * @return
//     */
//    public static String sign(String s_key, String out_trade_no, String callback_url, String success_url,
//                              BigDecimal amount) {
//
//        StringBuffer sb = new StringBuffer();
//        if (amount != null) {
//
//            //BigDecimal decimal = new BigDecimal(1.01);
//            BigDecimal setScale = amount.setScale(2, BigDecimal.ROUND_HALF_DOWN);
//            System.out.println(setScale.toString());
//            sb.append(setScale.toString());
//        }
//        if (StringUtils.isNotEmpty(out_trade_no)) {
//            sb.append(out_trade_no);
//        }
//        if (StringUtils.isNotEmpty(callback_url)) {
//            sb.append(callback_url);
//        }
//        if (StringUtils.isNotEmpty(success_url)) {
//            sb.append(success_url);
//        }
//        if (StringUtils.isNotEmpty(s_key)) {
//            sb.append(s_key);
//        }
//
//        String signStr = Md5Encrypter.md5(sb.toString());
//
//        return Md5Encrypter.md5(signStr);
//    }
//
//    //function signHuiDiao($key_id, $array)
//    //{
//    //
//    //    //利用千位分组来格式化数字的函数number_format()
//    //    //number_format($array['amount'],2)
//    //
//    //    $keyString = md5(number_format($array['amount'],2) . $array['out_trade_no'] . $array['trade_no']. $array['status'] .$key_id);
//    //
//    //    return md5($keyString);
//    //}
//}
