AdminApp.install('myapp.war', '[-appname myapp -cell DefaultCell01 -server server1]')
AdminConfig.save()

Sync1 = AdminControl.completeObjectName('type=NodeSync,process=nodeagent,node=AppSrvNode01,*')
AdminControl.invoke(Sync1, 'sync')