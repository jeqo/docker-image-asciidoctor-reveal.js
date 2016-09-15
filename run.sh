inotifywait -qm --event modify --format '%w' test/*.adoc | make &
make serve
