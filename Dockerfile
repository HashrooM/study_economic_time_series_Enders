FROM rocker/tidyverse

# パッケージインストールとlocaleの設定
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install locales vim && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF_8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9

# キャッシュクリア
RUN apt-get clean

# 必要なRライブラリインストール
RUN R -e "install.packages('markdown')" \
    && R -e "install.packages('fGarch')" \
    && R -e "install.packages('rugarch')" \
    && R -e "install.packages('urca')" \
    && R -e "install.packages('plm')" \
    && R -e "install.packages('mFilter')" \
    && R -e "install.packages('vars')" \
    && R -e "install.packages('forecast')" \
    && R -e "install.packages('aod')" \
    && R -e "install.packages('tsDyn')"

# ワーキングディレクトリ変更
WORKDIR /home/rstudio
