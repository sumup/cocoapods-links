require 'pod/links'

module Pod
  class Command
    class Register < Command
      self.summary = 'Register pod for local pod development'
      self.description = <<-DESC
        The link functionality allows developers to easily test their pods.
        Linking is a two-step process:

        Using 'pod register' in a project folder will create a global link.
        Then, in some other pod, 'pod link <name>' will create a link to 
        the local pod as a Development pod.

        This allows to easily test a pod because changes will be reflected immediately.
        When the link is no longer necessary, simply remove it with 'pod unlink <name>'.
      DESC

      self.arguments = [
        CLAide::Argument.new('POD_NAME', false)
      ]

      def initialize(argv)
        @pod = argv.shift_argument()
        super
      end

      #
      # We will register the pod as a local development pod.
      # If the pod is not explicitly given, we will use the first podspec for registering.
      #
      def run 
        Pod::Command::Links.register @pod
      end
    end
  end
end
