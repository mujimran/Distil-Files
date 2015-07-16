ubuntu@ip-172-31-18-114:/etc/nginx$ 
ubuntu@ip-172-31-18-114:/etc/nginx$ vi nginx.conf 

        error_log /var/log/nginx/error.log;
        
        ##
        # Gzip Settings
        ##
        
        gzip on;
        gzip_disable "msie6";
        
        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
        
        ##
        # nginx-naxsi config
        ##
        # Uncomment it if you installed nginx-naxsi
        ##
        
        #include /etc/nginx/naxsi_core.rules;
        
        ##
        # nginx-passenger config
        ##
        # Uncomment it if you installed nginx-passenger
        ##
        
        #passenger_root /usr;
        #passenger_ruby /usr/bin/ruby;
        
        ##
        # Virtual Host Configs
        ##
        
        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}       


#mail {
#       # See sample authentication script at:
#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#       # auth_http localhost/auth.php;
#       # pop3_capabilities "TOP" "USER";
#       # imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#       server {
#               listen     localhost:110;
#               protocol   pop3;
#               proxy      on;
#       }
#
#       server {
#               listen     localhost:143;
#               protocol   imap;
#               proxy      on;
#       }
#}