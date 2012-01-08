class Video < ActiveRecord::Base

	attr_accessor :video_value
	attr_accessible :video_value, :title, :video

	def getSuggestions
		data = []
		words = title.split
		wordsQuery = ""
		orV = ""
		words.map{ |word|
			wordsQuery += orV + "title LIKE '%#{word}%'"
			orV = " OR "
		}

		if wordsQuery != ""
			maxValues = []
			tmpData = []

			videos = Video.where("id <> ? AND (#{wordsQuery})", id)
			videos.map{ |tmpVideo|
				tmpVideoWords = tmpVideo.title.split
				comunWords = tmpVideoWords & words
				tmpVideo.video_value = comunWords.length
			}

			data = Video.getSuggestedVideos(videos)
		else
			data = order("id DESC").limit(3)
		end

		return data
	end

	def self.getSuggestedVideos(videos)
		total = videos.length
		for i in 2..total
			for j in 0..(total-i)
				if videos[j].video_value > videos[j+1].video_value
					aux = videos[j].video_value
					videos[j].video_value = videos[j+1].video_value
					videos[j+1].video_value = aux
				end
			end
		end

		if videos.length > 3
			videos.pop(videos.length - 3)
		end

		return videos
	end

end