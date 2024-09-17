FROM gradiant/ueransim:3.2.6

RUN apt update && apt install vim curl iproute2 -y

COPY ./trafficgen0-9-X3.sh /trafficgen0-9-X3.sh
COPY ./trafficgen0-9.sh /trafficgen0-9.sh

RUN chmod +x /trafficgen0-9-X3.sh /trafficgen0-9.sh

ENTRYPOINT [ "./entrypoint.sh" ]