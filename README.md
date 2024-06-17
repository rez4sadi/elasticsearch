# Nginx Log

## 1- Create a Custom Log according to Your needs and send it to fluentd (in http block)
```
        log_format json_log escape=json '{"connection_serial_number":$connection,'
                                                                         '"number_of_requests":$connection_requests,'
                                                                         '"response_status":"$status",'
                                                                         '"body_bytes_sent":$body_bytes_sent,'
                                                                         '"content_type":"$content_type",'
                                                                         '"host":"$host",'
                                                                         '"host_name":"$hostname",'
                                                                         '"http_name":"$http_name",'
                                                                         '"https":"$https",'
                                                                         '"proxy_protocol_addr":"$proxy_protocol_addr",'
                                                                         '"proxy_protocol_port":"$proxy_protocol_port",'
                                                                         '"query_string":"$query_string",'
                                                                         '"client_address":"$remote_addr",'
                                                                         '"http_ar_real_proto":"$http_ar_real_proto",'
                                                                         '"http_ar_real_ip":"$http_ar_real_ip",'
                                                                         '"http_ar_real_country":"$http_ar_real_country",'
                                                                         '"http_x_real_ip":"$http_x_real_ip",'
                                                                         '"http_x_forwarded_for":"$http_x_forwarded_for",'
                                                                         '"http_config":"$http_config",'
                                                                         '"client_port":"$remote_port",'
                                                                         '"remote_user":"$remote_user",'
                                                                         '"request":"$request",'
                                                                         '"request_time":$request_time,'
                                                                         '"request_id":"$request_id",'
                                                                         '"request_length":$request_length,'
                                                                         '"request_method":"$request_method",'
                                                                         '"request_uri":"$request_uri",'
                                                                         '"request_body":"$request_body",'
                                                                         '"scheme":"$scheme",'
                                                                         '"server_addr":"$server_addr",'
                                                                         '"server_name":"$server_name",'
                                                                         '"server_port":"$server_port",'
                                                                         '"server_protocol":"$server_protocol",'
                                                                         '"http_user_agent":"$http_user_agent",'
                                                                         '"time_local":"$time_local",'
                                                                         '"time_iso":"$time_iso8601",'
                                                                         '"url":"$scheme://$host$request_uri",'
                                                                         '"uri":"$uri"}';



```
# 2- in Your app  virtual host 
```
    access_log syslog:server=192.168.6.253:5140,tag=nginx_access  json_log;
```
# 3- Nginx_access-2024-05-23 must be created

![image](https://github.com/farshadnick/Devops-in-Action/assets/88557305/32ff4016-7276-4746-8aa8-b8ab4cf18757)

# 4- Create index pattern for kibana to get access to index in kibana
![image](https://github.com/farshadnick/Devops-in-Action/assets/88557305/41d6828e-97cb-453e-9a64-366f36394a56)

# 5- You can see the log in discover now 

![image](https://github.com/farshadnick/Devops-in-Action/assets/88557305/365ff4b6-9790-4729-96b3-515b9471c0e6)

Docker compose file for setting up a EFK service
================================================

A basic docker compose file that will set up Elasticsearch, Fluent Bit, and Kibana.

The following docker compose allows to ingest data through Forward protocol or Syslog in UDP mode, examples:

### Send data through Forward protocol

```json
echo "{\"key\": 1234}" | fluent-cat test
```

### Send data through Syslog UDP socket

```bash
logger -d -n 127.0.0.1 --port 5140 "hello"
```

