require "charty/backends/jfreechart/version"
require "charty"
require "charty-backends-jfreechart_jars"
require "fileutils"
java_import 'org.jfree.chart.ChartFactory'
java_import 'org.jfree.chart.ChartUtilities'
java_import 'org.jfree.chart.plot.PlotOrientation'
java_import 'org.jfree.data.category.DefaultCategoryDataset'
java_import 'org.jfree.data.xy.MatrixSeries'
java_import 'org.jfree.data.xy.MatrixSeriesCollection'
java_import 'org.jfree.data.xy.XYSeries'
java_import 'org.jfree.data.xy.XYSeriesCollection'

module Charty
  module Backends
    class JFreeChart
      Backends.register(:jfreechart, self)

      def initialize
        @plot = ::ChartFactory
      end

      def label(x, y)
      end

      def series=(series)
        @series = series
      end

      def render_layout(layout)
        raise NotImplementedError
      end

      def render(context, filename)
        # todo: I'm not sure if I can only render.

        chart = plot(@plot, context)
        # todo: add options for width and height
        width = 1000
        height = 800
        if filename
          FileUtils.mkdir_p(File.dirname(filename))
          javafile = java.io.File.new(filename)
          ChartUtilities.saveChartAsPNG(javafile, chart, width, height)
        end
      end

      def save(context, filename)
        # todo:
      end

      def plot(plot, context, subplot: false)
        case context.method
        when :bar
          dataset = DefaultCategoryDataset.new
          context.series.each do |data|
            data.ys.to_a.zip(Array.new(data.xs.size, data.label.to_s), data.xs.to_a.map(&:to_s)).each do |d|
              dataset.addValue(*d)
            end
          end
          title = context.title || ""
          xlabel = context.xlabel || ""
          ylabel = context.ylabel || ""
          plot.createBarChart(
            title,
            xlabel,
            ylabel,
            dataset,
            PlotOrientation::VERTICAL,
            true,
            false,
            false
          )
        when :barh
          dataset = DefaultCategoryDataset.new
          context.series.each do |data|
            data.ys.to_a.zip(Array.new(data.xs.size, data.label.to_s), data.xs.to_a.map(&:to_s)).each do |d|
              dataset.addValue(*d)
            end
          end
          title = context.title || ""
          xlabel = context.xlabel || ""
          ylabel = context.ylabel || ""
          plot.createBarChart(
            title,
            xlabel,
            ylabel,
            dataset,
            PlotOrientation::HORIZONTAL,
            true,
            false,
            false
          )
        when :box_plot
          # todo:
          raise NotImplementedError
        when :bubble
          dataset = MatrixSeriesCollection.new
          context.series.each do |data|
            # todo: fix args
            series = MatrixSeries.new(data.label.to_s, 1000, 1000)
            data.xs.to_a.zip(data.ys.to_a, data.zs.to_a).each do |series_param|
              series.update(*series_param)
            end
            dataset.addSeries(series)
          end
          title = context.title || ""
          xlabel = context.xlabel || ""
          ylabel = context.ylabel || ""
          plot.createBubbleChart(
            title,
            xlabel,
            ylabel,
            dataset,
            PlotOrientation::VERTICAL,
            true,
            false,
            false
          )
        when :curve
          dataset = DefaultCategoryDataset.new
          context.series.each do |data|
            data.xs.to_a.zip(data.ys.to_a).each do |a|
              dataset.addValue(a[1], data.label.to_s, a[0])
            end
          end
          title = context.title || ""
          xlabel = context.xlabel || ""
          ylabel = context.ylabel || ""
          plot.createLineChart(
            title,
            xlabel,
            ylabel,
            dataset,
            PlotOrientation::VERTICAL,
            true,
            false,
            false
          )
        when :scatter
          dataset = XYSeriesCollection.new
          context.series.each do |data|
            series = XYSeries.new(data.label.to_s)
            data.xs.to_a.zip(data.ys.to_a).each do |series_param|
              series.add(*series_param)
            end
            dataset.addSeries(series)
          end
          title = context.title || ""
          xlabel = context.xlabel || ""
          ylabel = context.ylabel || ""
          plot.createScatterPlot(
            title,
            xlabel,
            ylabel,
            dataset,
            PlotOrientation::VERTICAL,
            true,
            false,
            false
          )
        when :error_bar
          raise NotImplementedError
        when :hist
          # todo:
          raise NotImplementedError
        end
      end
    end
  end
end
