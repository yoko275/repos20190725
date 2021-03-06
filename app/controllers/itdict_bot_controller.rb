class ItdictBotController < ApplicationController
  require 'line/bot'
  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]
  
  def callback
      body = request.body.read

      signature = request.env['HTTP_X_LINE_SIGNATURE']
      unless client.validate_signature(body, signature)
          head :bad_request 
      end
  
      events = client.parse_events_from(body)
      
      events.each { |event|
          case event
          when Line::Bot::Event::Message
              case event.type
              when Line::Bot::Event::MessageType::Text
                  msg = event.message['text']
              #    id = msg.to_s
              #    if find_dict(id)
              #        dict = find_dict(id)
              #        message = [{
              #        type: 'text',
              #        text: "「#{dict.eword}」\n#{dict.jword}"
              #        }]
              #    else
                      message = {
                          type: 'text',
                          text: msg
                          #text: "該当なし"
                      }
              #    end
                  client.reply_message(event['replyToken'], message)
              end
          end
      }
      head :ok
  end

  def find_dict(ew)
      dict = Dict.find_by(eword: ew)
      if dict
          return dict
      else
          nil
      end
  end

  private
  # LINE Bot環境変数
  def client
      @client ||= Line::Bot::Client.new { |config|
          config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
          config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
  end    

end