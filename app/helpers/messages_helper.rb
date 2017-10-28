module MessagesHelper
  def message_if(group)
    if group.messages.blank?
      "まだメッセージはありません。"
    else
      latest = group.messages.order("created_at DESC")[0]
       if latest.text.blank?
         "画像が投稿されています"
       else
        latest.text
      end
    end
  end
end
