public with sharing class GetSessionIdController {

    public String SessionId {get;set;}

    public GetSessionIdController (){
        String sid = UserInfo.getSessionId();
        String AesKey = ApexPages.currentPage().getParameters().get('aeskey');

        if (AesKey == null){
            AesKey = EncodingUtil.base64Encode(Crypto.generateAesKey(256));
        }

        this.SessionId = 'SID_START' + CryptoHelper.encodeString(AesKey, sid) + 'SID_END';
    }
}