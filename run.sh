make serve &
while true
do
  inotifywait -qm --event modify --format '%w' slides/*.adoc | make
done
