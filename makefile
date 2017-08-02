all:
	go run *.go

log:
	$(shell killall go)
	$(eval TIME := $(shell date +"%a%b%d%y%T"))
	mkdir -p logs
	touch logs/$(TIME).log
	touch logs/latest.log
	ln -f logs/$(TIME).log logs/latest.log
	go run *.go > logs/$(TIME).log&
	watch -n 1 -d cat logs/latest.log
	echo "The server is still runnning!!!"

killit:
	$(shell killall go)

reset:
	rm -rf logs
	sh ./deleteentries.sh

watch:
	mkdir -p logs
	touch logs/latest.log
	watch -n 1 -d cat logs/latest.log
