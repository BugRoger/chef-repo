name "frontend"
description "All in one Frontend. Nginx as reverse proxy, Tmocat6 as appserver, MongoDB as db"
run_list "recipe[nginx]", "recipe[tomcat6]"
override_attributes "nginx" => { "version" => "0.7.65" }
