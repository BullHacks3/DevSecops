#!/bin/bash

Check=${1:-"Bakul"}

case $Check in
	BAKUL)
		echo "BAKUL found" ;;
	BaKuL)
		echo "BaKuL found" ;;
	Bakul)
		echo "Bakul found" ;;
	*)
		echo "No matching keyword found" ;;
esac
