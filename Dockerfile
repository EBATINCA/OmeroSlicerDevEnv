FROM slicer
USER root
ENV HOME=/home/kasm-default-profile
WORKDIR $HOME
RUN chown 0:1000 $HOME

ENV GITHUB=https://borjafernanruiz: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@github.com/EBATINCA/SlicerOmero.git
RUN git clone $GITHUB

RUN apt-get install libssl-dev -y
RUN apt-get install libbz2-dev -y
RUN apt-get install build-essential -y
RUN apt-get install python3.9-dev -y

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN /slicer/bin/python-real get-pip.py

RUN /slicer/bin/python-real -m pip install --verbose zeroc-ice=='3.6.5'
RUN /slicer/bin/PythonSlicer -m pip install --verbose zeroc-ice=='3.6.5'

RUN chown 1000:0 $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME

USER 1000


