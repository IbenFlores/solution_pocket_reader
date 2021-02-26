require_relative "repository"
require_relative "controller"
require_relative "router"

repo = Repository.new(File.join(__dir__, 'posts.csv'))
controller = Controller.new(repo)
router = Router.new(controller)
router.run
