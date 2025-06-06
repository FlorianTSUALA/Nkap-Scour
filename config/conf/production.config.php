<?php
    // development configuration settings go here
   /**
     * APPS CONFIG
  */
    define("CONF_APPS_NAME","Comelines Test");
    define("CONF_APPS_VERSION","Comelines ver 1.1 designed by Comelines");

    $root_app_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]/";
    define("CONF_APPS_URL", $root_app_url);

    define("CONF_DASHBOARD_NAME","Tableau de bord");
    define("CONF_DEFAULT_MAIL_FROM","@gmail.com");
    define("CONF_DEFAULT_MAIL_CC","Comelines@gmail.com");
    define("CONF_DEFAULT_MAIL_BCC", "Comelines@gmail.com");

    define("Comelines_EMAIL_CONTACT","contact@Comelines-pay.com");
    define("Comelines_EMAIL_INFO","info@Comelines-pay.com");

    define("CONF_ROOT_ACCESS_LOGIN",""); //kComelines
    define("CONF_ROOT_ACCESS_PWD","");
    define("CONF_ROOT_LOG","");

    define("CONF_USER_LOG","user");
    define("CONF_SESSION_TIME_OUT", 1440);

    define("CONF_IMGAGE_EXTENSION", '.jpg,.JPG,.png,.PNG,.jpeg,.JPEG,.jfif,.JFIF,.svg,.SVG');

    /**
    * DATABASE CONFIG
    */
    define("DB_HOST","127.0.0.1");
    define("DB_NAME","Comelines");
    define("DB_USERNAME","root");
    define("DB_PASSWORD","");

    define("DB_TABLE","sum_");