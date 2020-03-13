module Rack
  module OAuth2
    module Server
      module Rails
        module ResponseExt
          def redirect?
            ensure_finish do
              @response.redirect?
            end
          end

          def location
            ensure_finish do
              super
            end
          end

          def json
            ensure_finish do
              @response.body
            end
          end

          def header
            ensure_finish do
              @header
            end
          end

          def finish
            @finished = true
            super
          end

          private

          def finished?
            !!@finished
          end

          def ensure_finish
            @status, @header, @response = finish unless finished?
            yield
          end
        end
      end
    end
  end
end
