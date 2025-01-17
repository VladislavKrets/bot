FROM ubuntu:20.04
ENV TZ=Europe/Moscow
ADD reports /reports
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y
RUN apt install -y software-properties-common python3.8 python3-pip git tesseract-ocr libtesseract-dev tesseract-ocr-eng tesseract-ocr-rus
RUN python3 -m pip install python-dev-tools --user --upgrade
RUN git clone https://github.com/VladislavKrets/AptReportsMining.git
RUN cd AptReportsMining && pip install -r requirements.txt
RUN python3 -m nltk.downloader book
WORKDIR "/AptReportsMining"
CMD python3 -m text_extraction
