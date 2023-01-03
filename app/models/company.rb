class Company < ApplicationRecord
    has_many :employees


    validates :name , presence: true
    validates :description , presence: true

    #            for uploading image
    has_attached_file :image , styles: {thumb: "50x50>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


    #           for uploading video    
    has_attached_file :video , styles: {:thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}},
                                         :processors => [:transcoder]
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\z/ 


    #      to fetch image url in api
    def image_url
        image.url(:thumb)
    end


    #       to fetch video url in api
    def video_url
        video.url(:thumb)
    end
end
