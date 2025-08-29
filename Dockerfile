
FROM rocker/geospatial:4.5
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
 && apt-get install -y pandoc 

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
  mercurial gdal-bin libgdal-dev gsl-bin libgsl-dev \
  libc6-i386
RUN apt-get install -y --no-install-recommends unzip python3-pip dvipng  wget git make python3-venv 
RUN pip3 install --break-system-packages jupyter jupyter-cache flatlatex matplotlib
RUN apt-get --purge -y remove texlive.\*-doc$
RUN apt-get clean
RUN pip3 install --break-system-packages torch==2.8.0 --index-url https://download.pytorch.org/whl/cpu
RUN pip3 install --break-system-packages jax==0.7.0 
RUN R -e "install.packages('reticulate')"
RUN R -e "install.packages('purrr')" # map function


