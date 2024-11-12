import { User } from '../../pages/http/HttpPage';
import HttpUtilities from '../http/HttpUtilities';

export function getPosts (
  urlParams?:Record<string,string|number>
): Promise<User[]> {
  return HttpUtilities.get<User[]>('/posts',urlParams)
}
export function addPosts (
  extraData:Object,
): Promise<User> {
  return HttpUtilities.post<User>('/posts',extraData)
}