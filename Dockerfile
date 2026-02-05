ARG ALPINE_VER="3.16"
ARG PYTHON_VER="3.9"
ARG PYTHON_BUILD_VER="13"

FROM python:${PYTHON_VER}.${PYTHON_BUILD_VER}-alpine${ALPINE_VER}

ADD https://files.pythonhosted.org/packages/90/db/1d35b1e5913f8d7ff27d926ec9526641a761cbea23c22c07f4ddde910cf7/splunk_packaging_toolkit-1.2.4.tar.gz /splunk.tar.gz
RUN pip install splunk.tar.gz
COPY slim-conf-specs/transforms.conf.spec /usr/local/lib/python3.9/site-packages/slim/config/conf-specs/transforms.conf.spec
COPY slim-conf-specs/app.conf.spec /usr/local/lib/python3.9/site-packages/slim/config/conf-specs/app.conf.spec
RUN mkdir /apps
WORKDIR /apps
CMD ["slim"]
