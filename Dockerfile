# Use the official SQL Server Express image from Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA Y

# Create a working directory
WORKDIR /usr/src/app


# Grant permissions for the SQL Server user
USER root
#RUN chmod +x /usr/src/app/init-script.sh

# Expose the SQL Server port
EXPOSE 1501
# Use the official SQL Server Express image from Microsoft

# Enable TCP/IP protocol
RUN /opt/mssql/bin/mssql-conf set network.tcpport 1433
#RUN /opt/mssql/bin/mssql-conf set network.tcpenabled true

# Start SQL Server and run initialization scripts
#CMD /bin/bash ./entrypoint.sh