# You may add here your
# server {
#       ...
# }
# statements for each of your virtual hosts to this file

##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# http://wiki.nginx.org/Pitfalls
# http://wiki.nginx.org/QuickStart
# http://wiki.nginx.org/Configuration
#
# Generally, you will want to move this file somewhere, and start with a clean
# file but keep this around for reference. Or just disable in sites-enabled.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                # Distil Network assessment
                #http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass
		proxy_pass http://www.distilnetworks.com;
        }

        #Block HTTP requests originating from 192.225.213.20 (Distil VPN server)
        #http://www.cyberciti.biz/faq/linux-unix-nginx-access-control-howto/
	deny 192.225.213.20;

        #Block HTTP requests originating from mobile devices
        #useragent string match taken as is from http://www.cyberciti.biz/faq/setting-up-nginx-to-redirect-mobile-users-to-subdomain/

        set $mobile_rewrite do_not_perform;


        ## chi http_user_agent for mobile / smart phones ##
        if ($http_user_agent ~* "(android|bb\d+|meego).+mobile|avantgo|bada\/|bll
ackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lgee
 |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pp
ocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce||
phone)|xda|xiino") {
        set $mobile_rewrite perform;
        }
       if ($http_user_agent ~* "^(1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|aa
 wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|aa
s(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|buu
mb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll||
ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)||
esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|grr
(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p||
s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|innoo
|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)||
le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo))
|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zzz
)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((
(c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pp
dxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qaa
\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(gg
e|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|ss
ie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mbb
)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|tss
(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\--
v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |ncc
|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-)") {
        set $mobile_rewrite perform;
        }

        ##Block HTTP requests originating from mobile devices ##
        if ($mobile_rewrite = perform) {
        return 403;
        }
        # Only for nginx-naxsi used with nginx-naxsi-ui : process denied requests
        #location /RequestDenied {
        #       proxy_pass http://127.0.0.1:8080;    
        #}

        #error_page 404 /404.html;

        # redirect server error pages to the static page /50x.html
        #
        #error_page 500 502 503 504 /50x.html;
        #location = /50x.html {
        #       root /usr/share/nginx/html;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #       fastcgi_split_path_info ^(.+\.php)(/.+)$;
        #       # NOTE: You should have "cgi.fix_pathinfo = 0;" in php.ini
        #
        #       # With php6-cgi alone:
        #       fastcgi_pass 127.0.0.1:9000;
        #       # With php5-fpm:
        #       fastcgi_pass unix:/var/run/php5-fpm.sock;
        #       fastcgi_index index.php;
        #       include fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #       deny all;
        #}
}

# another virtual host using mix of IP-, name-, and port-based configuration
#
#server {
#       listen 8000;
#       listen somename:8080;
#       server_name somename alias another.alias;
#       root html;
#       index index.html index.htm;
#
#       location / {
#               try_files $uri $uri/ =404;
#       }
#}


# HTTPS server
#
#server {
#       listen 443;
#       server_name localhost;
#
#       root html;
#       index index.html index.htm;
#
#       ssl on;
#       ssl_certificate cert.pem;
#       ssl_certificate_key cert.key;
#
#       ssl_session_timeout 5m;
#
#       ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
#       ssl_ciphers "HIGH:!aNULL:!MD5 or HIGH:!aNULL:!MD5:!3DES";
#       ssl_prefer_server_ciphers on;
#
#       location / {
#               try_files $uri $uri/ =404;
#       }
#}
