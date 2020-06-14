#rubyイメージの取得
FROM ruby:2.5.3

#リポジトリのインストール
RUN apt-get update && \
  apt-get install -y build-essential \
  libpq-dev \
  node.js

RUN echo 'リポジトリ'

#作業ディレクトリの作成、設定
# RUN mkdir /XXXX
##作業ディレクトリ名をAPP_ROOTに割り当てる
ENV APP_ROOT /XXXX
WORKDIR $APP_ROOT
RUN echo 'ディレクトリ'

#ホスト側(ローカル)のGemfileを追加
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

#Gemfileのbundle install
RUN echo 'bundleインストール前'

RUN bundle install
ADD . $APP_ROOT
