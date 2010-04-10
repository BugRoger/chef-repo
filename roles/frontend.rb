name "frontend"
description "All in one Frontend. Nginx as reverse proxy, Tmocat6 as appserver, MongoDB as db"
run_list "recipe[nginx]", "recipe[tomcat]"