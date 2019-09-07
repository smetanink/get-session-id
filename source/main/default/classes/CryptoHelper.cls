public with sharing class CryptoHelper {

    private static Blob encodeDataAES256(String aKeyValue, String aDataValue) {
        Blob keyValue = EncodingUtil.base64Decode(aKeyValue);
        Blob dataValue = Blob.valueOf(aDataValue);
        Blob encryptedData = Crypto.encryptWithManagedIV('AES256', keyValue, dataValue);
        return encryptedData;
    }

    private static Blob decodeDataAES256(String aKeyValue, String aDataValue) {
        Blob keyValue = EncodingUtil.base64Decode(aKeyValue);
        Blob dataValue = EncodingUtil.base64Decode(aDataValue);
        return Crypto.decryptWithManagedIV('AES256', keyValue, dataValue);
    }

    public static String encodeString(String AesKey, String StringToEncode) {
        return EncodingUtil.base64Encode(encodeDataAES256(AesKey, StringToEncode));
    }

    public static String decodeString(String AesKey, String StringToDecode){
        return decodeDataAES256(AesKey, StringToDecode).toString();
    }
}