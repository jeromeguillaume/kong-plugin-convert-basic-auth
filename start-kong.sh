# remove the previous container
docker rm -f kong-gateway >/dev/null

docker run -d --name kong-gateway \
--network=kong-net \
--link kong-database:kong-database \
--mount type=bind,source=/Users/jeromeg/Documents/Kong/Tips/kong-plugin-convert-basic-auth/kong/plugins/convert-basic-auth,destination=/usr/local/share/lua/5.1/kong/plugins/convert-basic-auth \
-e "KONG_DATABASE=postgres" \
-e "KONG_PG_HOST=kong-database" \
-e "KONG_PG_USER=kong" \
-e "KONG_PG_PASSWORD=kongpass" \
-e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
-e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
-e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
-e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
-e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
-e "KONG_ADMIN_GUI_URL=http://localhost:8002" \
-e "KONG_PLUGINS=bundled,convert-basic-auth" \
-e KONG_LICENSE_DATA \
-p 8000:8000 \
-p 8443:8443 \
-p 8001:8001 \
-p 8002:8002 \
-p 8444:8444 \
kong/kong-gateway:3.2.2.1