class Worker:
	def __init__(self):
		pass

	def print_smth(self, msg):
		print('<<')
		print(msg)
		print('>>')

class Сustomer:
	def __init__(self, worker, first_name, last_name, expose_data=False):
		self._worker = worker
		self._worker.print_smth('{} {}'.format(first_name, last_name)) if expose_data else None


if __name__ == '__main__':
	w = Worker()		
	Сustomer(w, 'Mikalai', 'Hryb')
	print("-" * 20)
	Сustomer(w, 'Mikalai', 'Hryb', expose_data=True)

