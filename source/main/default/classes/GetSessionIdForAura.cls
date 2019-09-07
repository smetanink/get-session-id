public with sharing class GetSessionIdForAura {

    public static String getUserSessionId(){
        String sessionId = '';
        String AesKey = EncodingUtil.base64Encode(Crypto.generateAesKey(256));

        PageReference GetSessionIdPage = Page.GetSessionId;
        GetSessionIdPage.getParameters().put('aeskey', AesKey);
        String PageContent = GetSessionIdPage.getContent().toString();

        Integer startPosition = PageContent.indexOf('SID_START') + 'SID_START'.length();
        Integer endPosition = PageContent.indexOf('SID_END');

        sessionId = PageContent.substring(startPosition, endPosition);

        return CryptoHelper.decodeString(AesKey, sessionId);
    }
}