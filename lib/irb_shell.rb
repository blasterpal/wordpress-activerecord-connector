

    #from http://blade.nagaokaut.ac.jp/cgi-bin...by-talk/244139
    require 'irb'
    require 'irb/completion'

    module IRB
       def IRB.parse_opts
         # Don't touch ARGV, which belongs to the app which called this module.
       end

       def IRB.start_session(*args)
         unless $irb
           IRB.setup nil
           ## maybe set some opts here, as in parse_opts in irb/init.rb?
         end

         workspace = WorkSpace.new(*args)

         if @CONF[:SCRIPT] ## normally, set by parse_opts
           $irb = Irb.new(workspace, @CONF[:SCRIPT])
         else
           $irb = Irb.new(workspace)
         end

         @CONF[:IRB_RC].call($irb.context) if @CONF[:IRB_RC]
         @CONF[:MAIN_CONTEXT] = $irb.context

         trap 'INT' do
           $irb.signal_handle
         end

         custom_configuration if defined?(IRB.custom_configuration)

         catch :IRB_EXIT do
           $irb.eval_input
         end

         ## might want to reset your app's interrupt handler here
       end
    end

=begin
  
  class Object
     include IRB::ExtendCommandBundle # so that Marshal.dump works
  end
  
    if __FILE__ == $0
       x = Object.new
       puts "\nStarted irb shell for x"
       IRB.start_session(x)
       puts "\nStarted irb shell for x with current binding"
       IRB.start_session(binding, x)
       puts "\nRestarted irb shell for x with current binding"
       $irb.eval_input
       puts "\nExited irb shell"
       p x
    end
=end