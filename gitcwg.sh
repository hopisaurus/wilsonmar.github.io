#!/bin/bash
((!$#)) && echo No annotation parameter, so command ignored! && exit 1
git commit -a -m"$1" --gpg-sign=2E23C648
git push
