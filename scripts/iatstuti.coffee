# Description:
#   IATSTUTI hubot scripts
#
# Notes:
#   Collection of scripts for things that Hermann listens to
#

module.exports = (robot) ->

    robot.hear /(https?:\/\/)?dyry.me\/([a-zA-Z0-9]{5})/, (msg) ->
        hash = msg.match[2]

        robot.http("https://dyry.me/api/v1/lookup/hash/#{hash}").get() (err, res, body) ->
            data = JSON.parse(body)

            if ( ! data.error )
                title = data.response.title

                if ( title )
                    title = title.replace(/github/gi, "jithub")
                    msg.send "[#{hash}] #{title}"

