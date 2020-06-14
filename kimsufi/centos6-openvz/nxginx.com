worker_processes 2;
user solusvm;

error_log /var/log/svmstacknginx/error.log warn;
pid /usr/local/svmstack/nginx/pid/nginx.pid;

events {
	worker_connections  1024;
}

http {
	server_tokens off;
	include mime.types;
	default_type application/octet-stream;
	
	log_format main '$remote_addr - $remote_user [$time_local] "$request" '
		'$status $body_bytes_sent "$http_referer" '
		'"$http_user_agent" "$http_x_forwarded_for"';
	
	access_log /var/log/svmstacknginx/access.log main;
	sendfile on;
	keepalive_timeout 90;
	index Index.php;	
  client_max_body_size 0;
  	
	include services/*.conf;
}
