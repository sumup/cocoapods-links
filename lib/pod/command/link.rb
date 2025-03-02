require 'pod/links'

module Pod
  class Command
    class Link < Command
      self.summary = 'Create pod links for local pod development'
      self.description = <<-DESC
        The link functionality allows developers to easily test their pods.
        Linking is a two-step process:

        Using 'pod link' in a project folder will create a global link.
        Then, in some other pod, 'pod link <name>' will create a link to 
        the local pod as a Development pod.

        This allows to easily test a pod because changes will be reflected immediately.
        When the link is no longer necessary, simply remove it with 'pod unlink <name>'.
      DESC

      self.arguments = [
        CLAide::Argument.new('POD_NAME', true)
      ]

      def initialize(argv)
        @pod = argv.shift_argument()
        super
      end

      #
      # We will link the pod into the current project as a development dependency
      #
      def run 
        Pod::Command::Links.link @pod
      end
    end
  end
end
