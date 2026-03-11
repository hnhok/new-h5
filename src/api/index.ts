import axios from 'axios';

export const baseURL = 'http://localhost:3000/api';

export const apiClient = axios.create({
    baseURL,
    timeout: 5000,
});

export const getCategories = async () => {
    try {
        const response = await apiClient.get('/categories');
        return response.data;
    } catch (e) {
        console.warn('Backend API connection failed, using fallback data', e);
        return [
            { id: 1, name: '热门新闻', icon: '🔥' },
            { id: 2, name: '科技前沿', icon: '💻' },
            { id: 3, name: '数字生活', icon: '📱' },
            { id: 4, name: 'AI纪元', icon: '🤖' }
        ];
    }
}
