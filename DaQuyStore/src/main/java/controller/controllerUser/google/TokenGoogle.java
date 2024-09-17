package controller.controllerUser.google;

public class TokenGoogle {

    public static String GOOGLE_CLIENT_ID_LOGIN = "154679706679-29nmsp8c4r1phddtk3d4gcr1u5b5hic7.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET_LOGIN = "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";

    public static String GOOGLE_CLIENT_ID_REGISTER = "154679706679-r317sjkakuutsobdj1d050mvjtvbp6ve.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET_REGISTER = "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";


    public static String GOOGLE_REDIRECT_URI_LOGIN = "http://localhost:8080/DaQuyStore_war/loginGoogle";

    public static String GOOGLE_REDIRECT_URI_REGISTER = "http://localhost:8080/DaQuyStore_war/registerGoogle";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";


}
