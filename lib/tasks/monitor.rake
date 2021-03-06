namespace :monitor do
  desc "Check the number of failed jobs and stat the results to the log in a way Librato can understand"
  task :failed => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::FailedJobCheck.new,
      notifier: Monitoring::LibratoNotifier.new(prefix: "resque.failed_jobs", unit: "jobs"))
    monitor.monitor!
  end

  desc "Check the number of stale workers and stat the results to the log in a way Librato can understand"
  task :stale_workers => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::StaleWorkerCheck.new,
      notifier: Monitoring::LibratoNotifier.new(prefix: "resque.stale_workers", type: :measure, unit: "workers"))

    monitor.monitor!
  end

  desc "stat the sizes of all queues to the log in a way Librato can understand"
  task :queue_sizes => :environment do
    monitor = Monitoring::Monitor.new(
       checker: Monitoring::QueueSizeCheck.new,
      notifier: Monitoring::PerQueueLibratoNotifier.new(prefix: "resque.queue_size", type: :count, unit: "jobs"))

    monitor.monitor!
  end
end
