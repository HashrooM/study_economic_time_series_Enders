FROM rocker/tidyverse

# パッケージインストールとlocaleの設定
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install locales vim r-cran-rgl tcl tk&& \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF_8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

# キャッシュクリア
RUN apt-get clean

# Rライブラリインストール
# こんな感じでRライブラリをインストールできる
# 後でR実行時にライブラリ読み込みで失敗するようならaptで必要なパッケージをインストールする
RUN R -e "install.packages('zoo')" \
  && R -e "install.packages('forecast')" \
  && R -e "install.packages('tsibble')"

# ワーキングディレクトリ変更
WORKDIR /home/rstudio
