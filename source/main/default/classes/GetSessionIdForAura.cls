public with sharing class GetSessionIdForAura {

    public static String getUserSessionId(){
        String sessionId = '';
        PageReference reportPage = Page.GetSessionId;
        String GetSessionIdFromPage = reportPage.getContent().toString();

        Integer startPosition = GetSessionIdFromPage.indexOf('Start_Of_Session_Id') + 'Start_Of_Session_Id'.length();
        Integer endPosition = GetSessionIdFromPage.indexOf('End_Of_Session_Id');

        sessionId = GetSessionIdFromPage.substring(startPosition, endPosition);

        return sessionId;
    }
}