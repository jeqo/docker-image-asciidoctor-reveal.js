cat > index.html <<EOF
<html>
  <head>
    <meta http-equiv="refresh" content="0; url=slides/${INDEX}" />
  </head>
  <body/>
</html>
EOF
make serve &
while true
do
  inotifywait -qm --event modify --format '%w' slides/*.adoc | make
done
