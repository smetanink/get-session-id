public with sharing class SalesforceAPI {

    @AuraEnabled(Continuation=true Cacheable=true)
    public static String getLimits(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(Url.getOrgDomainUrl().toExternalForm() + '/services/data/v45.0/limits');
        req.setHeader('Authorization', 'Bearer ' + GetSessionIdForAura.getUserSessionId());
        req.setMethod('GET');

        HttpResponse res = h.send(req);

        return res.getBody();
    }
}