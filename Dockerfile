FROM ycogne/start_inutano_bridger
MAINTAINER Yannick Cogne
RUN cd /src 
RUN wget http://netix.dl.sourceforge.net/project/transcriptomeassembly/BinPacker_1.0.tar.gz
RUN tar xvf BinPacker_1.0.tar.gz
RUN cd ./BinPacker_1.0 && ./configure && make 
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh  
RUN chmod +x Miniconda2-latest-Linux-x86_64.sh   
RUN bash Miniconda2-latest-Linux-x86_64.sh -b -p /root/miniconda2
ENV PATH /root/miniconda2/bin:/src/BinPacker_1.0/:/src/Bridger_r2014-12-01/:$PATH
RUN conda config --add channels r
RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda
RUN conda install oases Trinity spades
