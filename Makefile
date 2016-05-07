setup:
	./setup.sh

bench-high-conn:
	wrk/wrk -t12 -c400 -d10s http://127.0.0.1:8000/

bench-normal-conn:
	wrk/wrk -t12 -c4 -d10s http://127.0.0.1:8000/

run-simple-gunicorn:
	gunicorn simpleapp:app

run-multiprocess-gunicorn:
	gunicorn -w 4 simpleapp:app

run-async-gunicorn:
	gunicorn --worker-class gaiohttp simpleapp:app

run-multiprocess-async-gunicorn:
	gunicorn --worker-class gaiohttp -w 4 simpleapp:app

run-aiohttp:
	python aiosimpleserver.py

run-uvaio:
	python uvaioserver.py

run-uwsgi:
	uwsgi --http :8000 --wsgi-file simpleapp.py --master --processes 6 --threads 2 --disable-logging
