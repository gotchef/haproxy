include_recipe "runit"

runit_service "haproxy" do
  action :stop
end
