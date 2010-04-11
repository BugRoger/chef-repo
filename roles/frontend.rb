name "frontend"
description "All in one Frontend. Nginx as reverse proxy, Tmocat6 as appserver, MongoDB as db"
run_list "recipe[nginx]", "recipe[tomcat]", "recipe[deploy-war]"
default_attributes "deploy-war" => { 
  "org"      => "ca.sap.com",
  "module"   => "de.crashedpixels.gwt.helloworld",
  "revision" => "INTEGRATION",
  "artifact" => "de.crashedpixels.gwt.helloworld-INTEGRATION.war"
}
