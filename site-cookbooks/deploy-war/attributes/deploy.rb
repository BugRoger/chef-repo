set_unless[:deploy][:bucket]     = "repository.crashedpixels.de"
set_unless[:deploy][:org]        = "ca.sap.com"
set_unless[:deploy][:module]     = "de.crashedpixels.gwt.helloworld"
set_unless[:deploy][:revision]   = "INTEGRATION"
set_unless[:deploy][:artifact]   = "de.crashedpixels.gwt.helloworld-INTEGRATION.war"
  
set_unless[:deploy][:context]    = "helloworld"
  
set_unless[:deploy][:deploy_to]  = "/u/apps/#{deploy[:context]}"  
  