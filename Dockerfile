#
# Dockerfile of glpi-agent
#
# EE Mar '23

FROM perl:5.36.0-threaded

COPY glpi-agent /usr/src/glpi-agent
WORKDIR /usr/src/glpi-agent

# HTTP::Proxy removed
RUN cpanm install Module::Install Cpanel::JSON::XS Data::UUID DateTime File::Copy::Recursive File::Which HTTP::Server::Simple HTTP::Server::Simple::Authen IO::Capture::Stderr IPC::Run LWP::Protocol::https LWP::UserAgent Net::IP Net::SNMP Parallel::ForkManager Test::Compile Test::Deep Test::Exception Test::MockModule Test::MockObject Test::NoWarnings Text::Template UNIVERSAL::require XML::LibXML
RUN perl Makefile.PL
RUN make
RUN make install


CMD [ "perl", "-v" ]
