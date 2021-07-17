package org.pachinko.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class AesUtils {
    private static final String ALGORITHM = "AES";
    public static final String SECRET = "aaaaaaaaaaaaaaaa";

    public AesUtils() {
    }

    public static String encrypt2Hex(String content, String secret) throws Exception {
        SecretKeySpec secretKey = new SecretKeySpec(secret.getBytes("utf-8"), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(1, secretKey);
        byte[] bb = cipher.doFinal(content.getBytes("utf-8"));
        return parseByte2HexStr(bb);
    }

    public static String decryptHex(String content, String secret) throws Exception {
        SecretKeySpec secretKey = new SecretKeySpec(secret.getBytes("utf-8"), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(2, secretKey);
        byte[] bb = parseHexStr2Byte(content);
        byte[] data = cipher.doFinal(bb);
        return new String(data, "utf-8");
    }

    public static String parseByte2HexStr(byte[] buf) {
        StringBuffer sb = new StringBuffer();

        for(int i = 0; i < buf.length; ++i) {
            String hex = Integer.toHexString(buf[i] & 255);
            if (hex.length() == 1) {
                hex = '0' + hex;
            }

            sb.append(hex.toUpperCase());
        }

        return sb.toString();
    }

    public static byte[] parseHexStr2Byte(String hexStr) {
        if (hexStr.length() < 1) {
            return null;
        } else {
            byte[] result = new byte[hexStr.length() / 2];

            for(int i = 0; i < hexStr.length() / 2; ++i) {
                int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
                int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2), 16);
                result[i] = (byte)(high * 16 + low);
            }

            return result;
        }
    }

    public static void main(String[] args) throws Exception {
        String secret = "MZygpewJsCpRrfOr";
        String content = "{\"xspaceUserNick\":\"jackychentest07\",\"xspaceServicerDepartmentId\":1000012001,\"xspaceLoginType\":\"uic\",\"xspaceServicerId\":98000335272,\"xspaceShowName\":\"jackychentest07\",\"xspaceTenantBuId\":10,\"xspaceSid\":\"1cc3c034a52578c7cc5650f876d5b445\",\"xspaceUserId\":2011}";
        String cc = encrypt2Hex(content, secret);
        System.out.println(cc);
        String data = decryptHex(cc, secret);
        System.out.println(data);
        System.out.println(decryptHex("5E6A739B829FC65D55707C44701A87332BF2B5FA627B8262AB760D1EC433EEA59B5EA42BE058949DDA77E5694FB355C8787E5E8720794396351A07BA2DBB5240F2020CC254D214583C45A11D9D95D450FC7DADD1D2104C810FFD509978F6F30BE95398D165EFA9A3225B95161B0DB51B19A434244DC59F007622E1EFC6BC67191446AA252D6BEEA51584B5F3238489514A607820CF4A68640640F88C70DFBA0BC9E8ABBE2F8A667357554AB121ED80D56FC32EA2585ED239740BED8F71D5AF3D4C1284C336FB73A0CC61162E2FC6CA6E6AEBDF6BCA4F0EA34765A21F1FD4EA2A0A9E303ABB9C57D4C050015A5F554AC36B5E8682600584E87795A90BFD24644E098C91C38519DD70CFAD5BBA55666931D838823203F12E09B271FC1F9B22917D", secret));
    }
}